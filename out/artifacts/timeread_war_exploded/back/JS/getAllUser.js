layui.use('table', function(){
    var table = layui.table;

    table.render({
        elem: '#mytable'
        ,height: 466
        ,url: '/user/selectByUserDetailed' //数据接口
        ,page: true //开启分页
        ,method:'post'
        ,limits: [10,20,50,100]  //每页条数的选择项，默认：[10,20,30,40,50,60,70,80,90]。
        ,limit: 10
        ,cols: [[ //表头
            {field: 'id', title: '序号', width:100, sort: true}
            ,{field: 'username', title: '用户名', width:150, sort: true}
            ,{field: 'email', title: '邮箱', width:200}
            ,{field: 'gender', title: '性别', width:100
                ,templet: function (d) {
                    var gender = "";
                    if(d.userDetailed.gender==0){
                        gender = "男";
                    } else if(d.userDetailed.gender==1){
                        gender = "女";
                    } else if(d.userDetailed.gender==2){
                        gender = "保密";
                    }
                    return gender;
                }
            }
            ,{field: 'birthday', title: '生日', width:200,templet: function (d) {
                    var birthday = "";
                    if(d.userDetailed.birthday==null){
                        birthday = "";
                    } else if(d.userDetailed.birthday!=null){
                        birthday = d.userDetailed.birthday;
                    }
                    return birthday;
                }}
            ,{field: 'registration_time', title: '注册时间', width:200,templet:'<div>{{d.userDetailed.registration_time}}<div>'}
            ,{field: 'point', title: '积分', width:100,templet:'<div>{{d.userDetailed.point}}<div>'}
        ]]
    });

});