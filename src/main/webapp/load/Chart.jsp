<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<script type="text/javascript">
    
    $(function () {
        carSelectorInit();
        autoUpdate();
    });
    
    var myChart = echarts.init(document.getElementById("container"));
    myChart.setOption(option = {
        xAxis: {
            type: 'category',
            data: []
        },
        yAxis: {
            type: 'value'
        },
        series: [{
            data: [],
            type: 'line',
            //smooth: true,   //折线带弧度

            label: {
                normal: {
                    show: true,
                    position: 'top'
                }
            }
        }]
    });
    myChart.showLoading();    //数据加载完之前先显示一段简单的loading动画

    ///货物下拉列表初始化
    function carSelectorInit(){
        $.ajax({
            type : 'GET',
            url : 'goods/findAllGoods',
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

    //更新Chart的数据
    function autoUpdate() {
        var da = [];
        var de = [];
        $.ajax({
            type : 'GET',
            url : 'Log/findGoodsChangeById',
            dataType : 'json',
            contentType : 'application/json',
            data : {
                id : $('#car_selector').val(),
                pageSize: 10,
                pageNum: 1
            } ,
            success : function(data){
                var count = 1;
                $.each(data.rows,function(index,elem){
                    da.push(parseInt(elem.current_inventory));
                    de.push(count++);
                });
                da.reverse();
                //de.reverse();
                myChart.hideLoading();    //隐藏加载动画
                myChart.setOption({        //加载数据图表
                    xAxis: {
                        type: 'category',
                        data: de
                    },
                    series: [{
                        data: da
                    }]
                });
            }
        });
    }

</script>


<div class="panel panel-default">
    <ol class="breadcrumb">
        <li>折线图</li>
    </ol>
    <div class="panel-body">
        <div class="row" >
            <div class="col-md-1 col-sm-1"></div>
            <div class="col-md-10 col-sm-11">
                <form action="" class="form-inline">
                    <div class="form-group">
                        <label class="form-label">货物：
                            　</label>
                        <select name="" id="car_selector" class="form-control">
                            <option value="">请选择</option>
                        </select>
                        　　
                        <button id="queryButton" class="btn btn-default" type="button" data-dismiss="modal" onclick="autoUpdate()">
                            <span>查询</span>
                        </button>

                    </div>
                </form>
            </div>
            <div id="container" style="height: 520%"></div>
        </div>
    </div>
</div>

