$(document).ready(function(){
    $('.update-cgpa').click(function(){
        var userId = $(this).find('td:eq(0)').text();
        var semesterId = $(this).find('td:eq(1)').text();
        var courseId = $(this).find('td:eq(2)').text();
        var gpa = prompt('Enter a CGPA');
        var $this = $(this);
        //console.log(userId);
        //console.log(semesterId.val());
        //console.log(courseId.val());
        $.ajax({
            method: "POST",
            url: "/stores/updateGPA",
            data: {
                user_id: userId,
                course_id: courseId,
                semester_id: semesterId,
                cgpa: gpa
            }
        }).success(function(data){
            $this.find('td:eq(3)').html(data.cgpa);
        });
    });
});