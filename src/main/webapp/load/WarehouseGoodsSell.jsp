<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<script>
    var WarehouseId = 2;// 仓库编号 2 代表槐林仓库
    var factoryId = null;// 工厂
    var stockin_goods = null;// 货物编号
    var goodsCache = new Array();//货物信息缓存

    $(function(){
        repositorySelectorInit();
        carSelectorInit();
        dataValidateInit();
        // detilInfoToggle();
        stockInOption();
        // fetchStorage();
        // supplierAutocomplete();
        goodsAutocomplete();
    })

    // 数据校验
    function dataValidateInit(){
        $('#stockin_form').bootstrapValidator({
            message : 'This is not valid',

            fields : {
                stockin_input : {
                    validators : {
                        notEmpty : {
                            message : '入库数量不能为空'
                        },
                        greaterThan: {
                            value: 0,
                            message: '入库数量不能小于0'
                        }
                    }
                }
            }
        })
    }

    // 货物信息自动匹配
    function goodsAutocomplete(){
        $('#goods_input').autocomplete({
            minLength : 0,
            delay : 500,
            source : function(request, response){
                $.ajax({
                    type : 'GET',
                    url : 'goods/findByNameLike',
                    dataType : 'json',
                    contentType : 'application/json',
                    data : {
                        name : request.term,
                    },
                    success : function(data){
                        var autoCompleteInfo = new Array();
                        $.each(data, function(index,elem){
                            goodsCache.push(elem);
                            autoCompleteInfo.push({label:elem.name,value:elem.id});
                        });
                        response(autoCompleteInfo);
                    }
                });
            },
            focus : function(event, ui){
                $('#goods_input').val(ui.item.label);
                return false;
            },
            select : function(event, ui){
                $('#goods_input').val(ui.item.label);
                stockin_goods = ui.item.value;
                return false;
            }
        })
    }

    //装车点下拉列表初始化
    function carSelectorInit(){
        $.ajax({
            type : 'GET',
            url : 'client/findAllClient',
            dataType : 'json',
            contentType : 'application/json',
            data:{},
            success : function(data){
                $.each(data,function(index,elem){
                    $('#car_selector').append("<option value='" + elem.id + "'>" + elem.name +"</option>");
                });
            },
            error : function(response){
                $('#car_selector').append("<option value='-1'>加载失败</option>");
            },
            select : function(){
                factoryId = $('#car_selector').val();
            }

        })
    }

    // 仓库下拉列表初始化
    function repositorySelectorInit(){
        $.ajax({
            type : 'GET',
            url : 'warehouse/findAll',
            dataType : 'json',
            contentType : 'application/json',
            data:{},
            success : function(data){
                $.each(data,function(index,elem){
                    $('#repository_selector').append("<option value='" + elem.id + "'>" + elem.name +"</option>");
                });
            },
            error : function(response){
                $('#repository_selector').append("<option value='-1'>加载失败</option>");
            }

        })
    }


    // 执行货物销售操作
    function stockInOption(){
        $('#submit').click(function(){
            // data validate
            $('#stockin_form').data('bootstrapValidator').validate();
            if (!$('#stockin_form').data('bootstrapValidator').isValid()) {
                return;
            }

            data = {
                warehouse_id : WarehouseId,  //仓库编号
                goods_id : stockin_goods,  //货物编号
                client_id : $('#car_selector').val(),   //客户编号
                handlers_id : 1,    //操作者
                sum : $('#stockin_input').val(),  //数量
            }

            $.ajax({
                type : 'POST',
                url : 'record/out',
                //dataType : 'text',
                // content : 'application/json',
                data : data,
                success : function(ret){
                    var msg;
                    var type;

                    if(ret == "ok"){
                        type = 'success';
                        msg = '成功';
                        inputReset();
                    }else{
                        type = 'error';
                        msg = '失败'
                    }
                    infoModal(type, msg);
                },
                error : function(response){
                    var msg = "服务器错误";
                    var type = "error";
                    infoModal(type, msg);
                }
            })
        });
    }

    // 页面重置
    function inputReset(){
        $('#supplier_input').val('');
        $('#goods_input').val('');
        $('#stockin_input').val('');
        $('#info_supplier_ID').text('-');
        $('#info_supplier_name').text('-');
        $('#info_supplier_tel').text('-');
        $('#info_supplier_address').text('-');
        $('#info_supplier_email').text('-');
        $('#info_supplier_person').text('-');
        $('#info_goods_ID').text('-');
        $('#info_goods_name').text('-');
        $('#info_goods_size').text('-');
        $('#info_goods_type').text('-');
        $('#info_goods_value').text('-');
        $('#info_storage').text('-');
        $('#stockin_form').bootstrapValidator("resetForm",true);
    }

    //操作结果提示模态框
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
        <li>仓库货物销售</li>
    </ol>
    <div class="panel-body">
        <div class="row" >
            <div class="col-md-6 col-sm-6">
                <div class="row">
                    <div class="col-md-1 col-sm-1"></div>
                    <div class="col-md-10 col-sm-11">
                        <form action="" class="form-inline">
                            <div class="form-group">
                                <label for="" class="form-label">出库货物：</label>
                                <input type="text" class="form-control" id="goods_input" placeholder="请输入货物名称">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-sm-6">
                <div class="row">
                    <div class="col-md-1 col-sm-1"></div>
                    <div class="col-md-10 col-sm-11">
                        <form action="" class="form-inline" id="stockin_form">
                            <div class="form-group">
                                <label for="" class="control-label">货物数量：</label>
                                <input type="text" class="form-control" placeholder="请输入数量" id="stockin_input" name="stockin_input">
                                <%--<span>(当前库存量：</span>--%>
                                <%--<span id="info_storage">-</span>--%>
                                <%--<span>)</span>--%>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="row" style="margin-top: 10px">
            <div class="col-md-6 col-sm-6">
                <div class="row">
                    <div class="col-md-1 col-sm-1"></div>
                    <div class="col-md-10 col-sm-11">
                        <form action="" class="form-inline">
                            <div class="form-group">
                                <label for="" class="form-label">客户：　
                                    　</label>
                                <select name="" id="car_selector" class="form-control">
                                    <option value="">请选择</option>
                                </select>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <%--<div class="col-md-6 col-sm-6">--%>
            <%--<div class="row">--%>
            <%--<div class="col-md-1 col-sm-1"></div>--%>
            <%--<div class="col-md-10 col-sm-11">--%>
            <%--<form action="" class="form-inline">--%>
            <%--<div class="form-group">--%>
            <%--<label for="" class="form-label">仓库：</label>--%>
            <%--<select name="" id="repository_selector" class="form-control">--%>
            <%--<option value="">请选择</option>--%>
            <%--</select>--%>
            <%--</div>--%>
            <%--</form>--%>
            <%--</div>--%>
            <%--</div>--%>
            <%--</div>--%>
        </div>
        <%--<div class="row" style="margin-top:20px">--%>
        <%--</div>--%>
        <div class="row" style="margin-top:80px"></div>
    </div>
    <div class="panel-footer">
        <div style="text-align:right">
            <button class="btn btn-success" id="submit">确定</button>
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
