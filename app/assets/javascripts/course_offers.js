$(document).ready(function(){

    $(document).on('change','#course_offer_semester_id', function(){
        var selectedOption = $(this).find("option:selected");

        $.ajax({
            method: "GET",
            url: "/semesters/"+selectedOption.val()+"/getSemesterCourses",
            data: {}
        })
            .success(function( data ) {
                console.log(data);
            });
    });
    $(document).on('change','.offered_courses',function(){

        var semesterId = $("#course_offer_semester_id option:selected").val();
        var courseId = $(this).attr('course-id');

        if($(this).prop('checked')){
            $.ajax({
                method: "POST",
                url: "/course_offers/addCourse",
                data: { id: courseId, semester_id: semesterId }
            })
                .success(function( data ) {
                    console.log(data);
                });
        }else{
            $.ajax({
                method: "DELETE",
                url: "/course_offers/deleteCourse",
                data: { id: courseId, semester_id: semesterId }
            })
                .success(function( data ) {
                    console.log(data);
                });
        }
    });
});