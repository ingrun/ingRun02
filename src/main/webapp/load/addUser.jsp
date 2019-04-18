<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<script>
    $(function() {
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

                var name = $('#newUserName').val();
                var newPassword = $('#newPassword').val();
                var rePassword = $('#newPassword_re').val();
                var data = {
                    "name" : name,
                    "newPassword" : newPassword,
                    "newPassword_re" : rePassword
                }

                // 将数据通过 AJAX 发送到后端
                $.ajax({
                    type: "POST",
                    url:"user/addUser",
                    data:data,
                    success : function(ret){
                        var msg;
                        var type;
                        if(ret == "ok"){
                            type = 'success';
                            msg = '添加用户成功';
                            // inputReset();
                        }else{
                            type = 'error';
                            msg = ret;
                        }
                        infoModal(type, msg);
                        inputClean();
                    },
                    error : function(response){
                        var msg = "服务器错误";
                        var type = "error";
                        infoModal(type, msg);
                    }
                });
            })
    }

    function inputClean() {
        $('#newUserName').val("");
        $('#newPassword').val("");
        $('#newPassword_re').val("");
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
        <li>添加用户</li>
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
                            <input type="text" class="form-control" id="newUserName"
                                   name="newUserName">
                        </div>
                    </div>

                    <div class="form-group">
                        <label  class="control-label col-md-4 col-sm-4"> 输入密码: </label>
                        <div class="col-md-8 col-sm-8">
                            <input type="password" class="form-control" id="newPassword"
                                   name="newPassword">
                        </div>
                    </div>

                    <div class="form-group">
                        <label  class="control-label col-md-4 col-sm-4"> 确认密码: </label>
                        <div class="col-md-8 col-sm-8 has-feedback">
                            <input type="password" class="form-control" id="newPassword_re"
                                   name="newPassword_re">
                        </div>
                    </div>

                    <div>
                        <div class="col-md-4 col-sm-4"></div>
                        <div class="col-md-4 col-sm-4">
                            <button type="submit" class="btn btn-success">
                                &nbsp;&nbsp;&nbsp;&nbsp;确认添加&nbsp;&nbsp;&nbsp;&nbsp;</button>
                        </div>
                        <div class="col-md-4 col-sm-4"></div>
                    </div>
                    <input id="reset" type="reset" style="display:none">
                </form>

            </div>
            <div class="col-md-4 col-sm-2"></div>
        </div>

        <div class="row">
            <div class="col-md-3 col-sm-1"></div>
            <div class="col-md-6 col-sm-10">
                <div class="alert alert-info" style="margin-top: 50px">
                    <p>添加用户账户规则说明：</p>
                    <p>1.密码至少6位,可以是数字，大小写字母，特殊符号。</p>
                    <p>2.密码不可与账号相同</p>
                    <p>3.账号不要使用中文</p>
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
