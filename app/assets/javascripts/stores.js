
$(document).ready(function(){
    $('#store_semester_id').change(function(){
        var selectedOption = $(this).find("option:selected");
        $.ajax({
            method: "GET",
            url: "/semesters/"+selectedOption.val()+"/getCourses",
            data: {}
        })
            .success(function( data ) {
                console.log(data);
            });
    });
    $(document).on('change','[course-id]',function(){
        var semesterId = $(".semester-select option:selected").val();
        var courseId = $(this).attr('course-id');
        if($(this).prop('checked')){
            $.ajax({
                method: "POST",
                url: "/stores/addCourse",
                data: { id: courseId, semester_id: semesterId }
            })
                .success(function( data ) {
                    console.log(data);
                });
        }else{
            $.ajax({
                method: "DELETE",
                url: "/stores/deleteCourse",
                data: { id: courseId, semester_id: semesterId }
            })
                .success(function( data ) {
                    console.log(data);
                });
        }
    });
});