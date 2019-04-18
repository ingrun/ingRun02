<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<script>
    $(function() {
        userInfoInit();
        bootstrapValidatorInit();
    });

    function bootstrapValidatorInit(){
        $('#form').bootstrapValidator({
            message:'This value is not valid',
            feedbackIcons:{
                valid:'glyphicon glyphicon-ok',
                invalid:'glyphicon glyphicon-remove',
                validating:'glyphicon glyphicon-refresh'
            },
            excluded: [':disabled'],
            fields:{// 字段验证
                newPassword:{// 新密码
                    validators:{
                        notEmpty:{
                            message:'输入不能为空'
                        },
                        stringLength:{
                            min:6,
                            max:16,
                            message:'密码长度为6~16位'
                        },
                        callback:{}
                    }
                },
                newPassword_re:{// 重复新密码
                    validators:{
                        notEmpty:{
                            message:'输入不能为空'
                        },
                        identical:{
                            field:'newPassword',
                            message:'两次密码不一致'
                        }
                    }
                }
            }
        })
            .on('success.form.bv',function(e){
                // 禁用默认表单提交
                e.preventDefault();

                // 获取 form 实例
                var $form = $(e.target);
                // 获取 bootstrapValidator 实例
                var bv = $form.data('bootstrapValidator');

                var type ;
                var Message;

                var data = {
                    "username" :  $('#car_selector').val()
                };

                // 将数据通过 AJAX 发送到后端
                $.ajax({
                    type: "POST",
                    url:"user/delUser",
                    data:data,
                    success : function(ret){
                        var msg;
                        var type;
                        if(ret == "ok"){
                            type = 'success';
                            msg = '成功';
                        }else{
                            type = 'error';
                            msg = ret
                        }
                        infoModal(type, msg);
                        $('#form').bootstrapValidator("resetForm",true);
                    },
                    error : function(response){
                        var msg = "服务器错误";
                        var type = "error";
                        infoModal(type, msg);
                    }
                });
            })
    }

    //加载用户信息
    function userInfoInit(){
        $.ajax({
            type : 'GET',
            url : 'user/findAllUser',
            dataType : 'json',
            contentType : 'application/json',
            data:{},
            success : function(data){
                $.each(data,function(index,elem){
                    $('#car_selector').append("<option value="+elem.name+">" + elem.name +"</option>");
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
<!-- 修改密码面板 -->
<div class="panel panel-default">
    <!-- 面包屑 -->
    <ol class="breadcrumb">
        <li>删除用户账户</li>
    </ol>

    <div class="panel-body">
        <!--  修改密码主体部分 -->
        <div class="row">
            <div class="col-md-4 col-sm-2"></div>
            <div class="col-md-4 col-sm-8">

                <form action="" class="form-horizontal" style=""
                      role="form" id="form">
                    <div class="form-group">
                        <label  class="control-label col-md-4 col-sm-4"> 用户名: </label>
                        <div class="col-md-8 col-sm-8">
                            <select name="" id="car_selector" class="form-control">
                                <option value="">请选择</option>
                            </select>
                        </div>
                    </div>

                    <div>
                        <div class="col-md-4 col-sm-4"></div>
                        <div class="col-md-4 col-sm-4">
                            <button type="submit" class="btn btn-success">
                                &nbsp;&nbsp;&nbsp;&nbsp;确认删除&nbsp;&nbsp;&nbsp;&nbsp;</button>
                        </div>
                        <div class="col-md-4 col-sm-4"></div>
                    </div>
                    <input id="reset" type="reset" style="display:none">
                </form>

                <br />
                <br />
            </div>
            <div class="col-md-4 col-sm-2"></div>
        </div>

        <div class="row">
            <div class="col-md-3 col-sm-1"></div>
            <div class="col-md-6 col-sm-10">
                <div class="alert alert-info" style="margin-top: 50px">
                    <p>删除用户账户规则说明：</p>
                    <p>1.如果不是必要，请不要删除用户！</p>
                    <p>2.用户删除无法找回！</p>
                    <p>3.删除后操作记录不会被删除</p>
                </div>
            </div>
            <div class="col-md-3 col-sm-1"></div>
        </div>
    </div>
</div>


<%--操作结果提示模态框--%>
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

