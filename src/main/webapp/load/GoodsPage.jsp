<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<script>
    var search_type_goods = "none";
    var search_keyWord = "";
    var selectID;

    $(function() {
        optionAction();
        searchAction();
        goodsListInit();
        bootstrapValidatorInit();

        addGoodsAction();
        editGoodsAction();
        deleteGoodsAction();
    })

    // 下拉框選擇動作
    function optionAction() {
        $(".dropOption").click(function() {
            var type = $(this).text();
            $("#search_input").val("");
            if (type == "所有") {
                $("#search_input").attr("readOnly", "true");
                search_type_goods = "searchAll";
            } else if (type == "货物ID") {
                $("#search_input").removeAttr("readOnly");
                search_type_goods = "searchByID";
            } else if (type == "货物名称") {
                $("#search_input").removeAttr("readOnly");
                search_type_goods = "searchByName";
            } else {
                $("#search_input").removeAttr("readOnly");
            }

            $("#search_type").text(type);
            $("#search_input").attr("placeholder", type);
        })
    }

    // 搜索动作
    function searchAction() {
        $('#search_button').click(function() {
            search_keyWord = $('#search_input').val();
            tableRefresh();
        })
    }


    // 表格初始化
    function goodsListInit() {
        $('#goodsList')
            .bootstrapTable(
                {
                    columns : [
                        {
                            field : 'id',
                            title : '货物ID'
                            //sortable: true
                        },
                        {
                            field : 'name',
                            title : '货物名称'
                        },
                        {
                            field : 'type',
                            title : '货物类型'
                        },
                        {
                            field : 'operation',
                            title : '操作',
                            formatter : function(value, row, index) {
                                var s = '<button class="btn btn-info btn-sm edit"><span>编辑</span></button>';
                                var d = '<button class="btn btn-danger btn-sm delete"><span>删除</span></button>';
                                var fun = '';
                                return s + ' ' + d;
                            },
                            events : {
                                // 操作列中编辑按钮的动作
                                'click .edit' : function(e, value,
                                                         row, index) {
                                    selectID = row.id;
                                    rowEditOperation(row);
                                },
                                'click .delete' : function(e,
                                                           value, row, index) {
                                    selectID = row.id;
                                    $('#deleteWarning_modal').modal(
                                        'show');
                                }
                            }
                        } ],
                    url : 'goods/findAll',
                    method : 'GET',
                    queryParams : queryParams,
                    sidePagination : "server",
                    dataType : 'json',
                    pagination : true,
                    sortName:'',  //undefined
                    queryParamsType: "",
                    pageNumber : 1,
                    pageSize : 10,
                    pageList : [ 10, 25, 50, 100 ],
                    clickToSelect : true
                });
    }

    // 分页查询参数
    function queryParams(params) {
        var temp = {
            pageNum : params.pageNumber,
            pageSize : params.pageSize,
        };
        return temp;
    }

    // 表格刷新
    function tableRefresh() {
        $('#goodsList').bootstrapTable('refresh', {
            query : {}
        });
    }

    // 行编辑操作
    function rowEditOperation(row) {
        $('#edit_modal').modal("show");

        // load info
        $('#goods_form_edit').bootstrapValidator("resetForm", true);
        $('#goods_name_edit').val(row.name);
        $('#goods_type_edit').val(row.type);
        $('#goods_size_edit').val(row.size);
        $('#goods_value_edit').val(row.value);
    }

    // 添加供应商模态框数据校验
    function bootstrapValidatorInit() {
        $("#goods_form,#goods_form_edit").bootstrapValidator({
            message : 'This is not valid',
            feedbackIcons : {
                valid : 'glyphicon glyphicon-ok',
                invalid : 'glyphicon glyphicon-remove',
                validating : 'glyphicon glyphicon-refresh'
            },
            excluded : [ ':disabled' ],
            fields : {
                goods_name : {
                    validators : {
                        notEmpty : {
                            message : '货物名称不能为空'
                        }
                    }
                },
                // goods_value : {
                //     validators : {
                //         notEmpty : {
                //             message : '货物价值不能为空'
                //         }
                //     }
                // }
            }
        })
    }

    // 编辑货物信息
    function editGoodsAction() {
        $('#edit_modal_submit').click(
            function() {
                $('#goods_form_edit').data('bootstrapValidator')
                    .validate();
                if (!$('#goods_form_edit').data('bootstrapValidator')
                    .isValid()) {
                    return;
                }

                var data = {
                    id : selectID,
                    name : $('#goods_name_edit').val(),
                    type : $('#goods_type_edit').val(),
                }

                // ajax
                $.ajax({
                    type : "POST",
                    url : 'goods/updGoods',
                    data : data,
                    success : function(response) {
                        $('#edit_modal').modal("hide");
                        var type;
                        var msg;
                        if (response== "ok") {
                            type = "success";
                            msg = "货物信息更新成功";
                        } else if (resposne == "error") {
                            type = "error";
                            msg = "货物信息更新失败"
                        }
                        infoModal(type, msg);
                        tableRefresh();
                    },
                    error : function(response) {
                    }
                });
            });
    }

    // 刪除货物信息
    function deleteGoodsAction(){
        $('#delete_confirm').click(function(){
            var data = {
                id : selectID
            }

            // ajax
            $.ajax({
                type : "GET",
                url : "goods/delGoods",
                // dataType : "json",
                // contentType : "application/json",
                data : data,
                success : function(response){
                    $('#deleteWarning_modal').modal("hide");
                    var type;
                    var msg;
                    if(response== "ok"){
                        type = "success";
                        msg = "货物信息删除成功";
                    }else{
                        type = "error";
                        msg = "货物信息删除失败";
                    }
                    infoModal(type, msg);
                    tableRefresh();
                },error : function(response){
                }
            })

            $('#deleteWarning_modal').modal('hide');
        })
    }

    // 添加货物信息
    function addGoodsAction() {
        $('#add_goods').click(function() {
            $('#add_modal').modal("show");
        });

        $('#add_modal_submit').click(function() {
            var data = {
                name : $('#goods_name').val(),
                type : $('#goods_type').val(),
            };
            // ajax
            $.ajax({
                type : "POST",
                url : "goods/addGoods",
                // dataType : "json",
                // contentType : "application/json",
                data : data,
                success : function(response) {
                    $('#add_modal').modal("hide");
                    var msg;
                    var type;
                    if (response == "ok") {
                        type = "success";
                        msg = "货物添加成功";
                    } else if (response== "error") {
                        type = "error";
                        msg = "货物添加失败";
                    }
                    infoModal(type, msg);
                    tableRefresh();

                    // reset
                    $('#goods_name').val("");
                    $('#goods_type').val("");
                    $('#goods_size').val("");
                    $('#goods_value').val("");
                    $('#goods_form').bootstrapValidator("resetForm", true);
                },
                error : function(response) {
                }
            })
        })
    }

    // 操作结果提示模态框
    function infoModal(type, msg) {
        $('#info_success').removeClass("hide");
        $('#info_error').removeClass("hide");
        if (type == "success") {
            $('#info_error').addClass("hide");
        } else if (type == "error") {
            $('#info_success').addClass("hide");
        }
        $('#info_content').text(msg);
        $('#info_modal').modal("show");
    }
</script>
<div class="panel panel-default">
    <ol class="breadcrumb">
        <li>货物信息管理</li>
    </ol>
    <div class="panel-body">
        <%--<div class="row">--%>
            <%--<div class="col-md-1 col-sm-2">--%>
                <%--<div class="btn-group">--%>
                    <%--<button class="btn btn-default dropdown-toggle"--%>
                            <%--data-toggle="dropdown">--%>
                        <%--<span id="search_type">查询方式</span> <span class="caret"></span>--%>
                    <%--</button>--%>
                    <%--<ul class="dropdown-menu" role="menu">--%>
                        <%--<li><a href="javascript:void(0)" class="dropOption">货物ID</a></li>--%>
                        <%--<li><a href="javascript:void(0)" class="dropOption">货物名称</a></li>--%>
                        <%--<li><a href="javascript:void(0)" class="dropOption">所有</a></li>--%>
                    <%--</ul>--%>
                <%--</div>--%>
            <%--</div>--%>
            <%--<div class="col-md-9 col-sm-9">--%>
                <%--<div>--%>
                    <%--<div class="col-md-3 col-sm-4">--%>
                        <%--<input id="search_input" type="text" class="form-control"--%>
                               <%--placeholder="货物ID">--%>
                    <%--</div>--%>
                    <%--<div class="col-md-2 col-sm-2">--%>
                        <%--<button id="search_button" class="btn btn-success">--%>
                            <%--<span class="glyphicon glyphicon-search"></span> <span>查询</span>--%>
                        <%--</button>--%>
                    <%--</div>--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</div>--%>

        <div class="row" style="margin-top: 25px">
            <div class="col-md-5">
                <button class="btn btn-sm btn-default" id="add_goods">
                    <span class="glyphicon glyphicon-plus"></span> <span>添加货物信息</span>
                </button>
            </div>
            <div class="col-md-5"></div>
        </div>

        <div class="row" style="margin-top: 15px">
            <div class="col-md-12">
                <table id="goodsList" class="table table-striped"></table>
            </div>
        </div>
    </div>
</div>

<!-- 添加货物信息模态框 -->
<div id="add_modal" class="modal fade" table-index="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true"
     data-backdrop="static">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button class="close" type="button" data-dismiss="modal"
                        aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">添加货物信息</h4>
            </div>
            <div class="modal-body">
                <!-- 模态框的内容 -->
                <div class="row">
                    <div class="col-md-1 col-sm-1"></div>
                    <div class="col-md-8 col-sm-8">
                        <form class="form-horizontal" role="form" id="goods_form"
                              style="margin-top: 25px">
                            <div class="form-group">
                                <label for="" class="control-label col-md-4 col-sm-4"> <span>货物名称：</span>
                                </label>
                                <div class="col-md-8 col-sm-8">
                                    <input type="text" class="form-control" id="goods_name"
                                           name="goods_name" placeholder="货物名称">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="" class="control-label col-md-4 col-sm-4"> <span>货物类型：</span>
                                </label>
                                <div class="col-md-8 col-sm-8">
                                    <input type="text" class="form-control" id="goods_type"
                                           name="goods_type" placeholder="货物类型">
                                </div>
                            </div>
                            <%--<div class="form-group">--%>
                                <%--<label for="" class="control-label col-md-4 col-sm-4"> <span>货物尺寸：</span>--%>
                                <%--</label>--%>
                                <%--<div class="col-md-8 col-sm-8">--%>
                                    <%--<input type="text" class="form-control" id="goods_size"--%>
                                           <%--name="goods_size" placeholder="货物尺寸">--%>
                                <%--</div>--%>
                            <%--</div>--%>
                            <%--<div class="form-group">--%>
                                <%--<label for="" class="control-label col-md-4 col-sm-4"> <span>货物价值：</span>--%>
                                <%--</label>--%>
                                <%--<div class="col-md-8 col-sm-8">--%>
                                    <%--<input type="text" class="form-control" id="goods_value"--%>
                                           <%--name="goods_value" placeholder="货物价值">--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        </form>
                    </div>
                    <div class="col-md-1 col-sm-1"></div>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-default" type="button" data-dismiss="modal">
                    <span>取消</span>
                </button>
                <button class="btn btn-success" type="button" id="add_modal_submit">
                    <span>提交</span>
                </button>
            </div>
        </div>
    </div>
</div>

<!-- 提示消息模态框 -->
<div class="modal fade" id="info_modal" table-index="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button class="close" type="button" data-dismiss="modal"
                        aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">信息</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-4 col-sm-4"></div>
                    <div class="col-md-4 col-sm-4">
                        <div id="info_success" class=" hide" style="text-align: center;">
                            <img src="media/icons/success-icon.png" alt=""
                                 style="width: 100px; height: 100px;">
                        </div>
                        <div id="info_error" style="text-align: center;">
                            <img src="media/icons/error-icon.png" alt=""
                                 style="width: 100px; height: 100px;">
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-4"></div>
                </div>
                <div class="row" style="margin-top: 10px">
                    <div class="col-md-4 col-sm-4"></div>
                    <div class="col-md-4 col-sm-4" style="text-align: center;">
                        <h4 id="info_content"></h4>
                    </div>
                    <div class="col-md-4 col-sm-4"></div>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-default" type="button" data-dismiss="modal">
                    <span>&nbsp;&nbsp;&nbsp;关闭&nbsp;&nbsp;&nbsp;</span>
                </button>
            </div>
        </div>
    </div>
</div>

<!-- 删除提示模态框 -->
<div class="modal fade" id="deleteWarning_modal" table-index="-1"
     role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button class="close" type="button" data-dismiss="modal"
                        aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">警告</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-3 col-sm-3" style="text-align: center;">
                        <img src="media/icons/warning-icon.png" alt=""
                             style="width: 70px; height: 70px; margin-top: 20px;">
                    </div>
                    <div class="col-md-8 col-sm-8">
                        <h3>是否确认删除该条货物信息</h3>
                        <p>(注意：若该货物已经有仓库进出库记录或有仓存记录，则该货物信息将不能删除成功。如需删除该货物的信息，请先确保该货物没有关联的仓库进出库记录或有仓存记录)</p>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-default" type="button" data-dismiss="modal">
                    <span>取消</span>
                </button>
                <button class="btn btn-danger" type="button" id="delete_confirm">
                    <span>确认删除</span>
                </button>
            </div>
        </div>
    </div>
</div>

<!-- 编辑货物信息模态框 -->
<div id="edit_modal" class="modal fade" table-index="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true"
     data-backdrop="static">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button class="close" type="button" data-dismiss="modal"
                        aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">编辑货物信息</h4>
            </div>
            <div class="modal-body">
                <!-- 模态框的内容 -->
                <div class="row">
                    <div class="col-md-1 col-sm-1"></div>
                    <div class="col-md-8 col-sm-8">
                        <form class="form-horizontal" role="form" id="goods_form_edit"
                              style="margin-top: 25px">
                            <div class="form-group">
                                <label for="" class="control-label col-md-4 col-sm-4"> <span>货物名称：</span>
                                </label>
                                <div class="col-md-8 col-sm-8">
                                    <input type="text" class="form-control" id="goods_name_edit"
                                           name="goods_name" placeholder="货物名称">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="" class="control-label col-md-4 col-sm-4"> <span>货物类型：</span>
                                </label>
                                <div class="col-md-8 col-sm-8">
                                    <input type="text" class="form-control"
                                           id="goods_type_edit" name="goods_type"
                                           placeholder="货物类型">
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="col-md-1 col-sm-1"></div>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-default" type="button" data-dismiss="modal">
                    <span>取消</span>
                </button>
                <button class="btn btn-success" type="button" id="edit_modal_submit">
                    <span>确认更改</span>
                </button>
            </div>
        </div>
    </div>
</div>