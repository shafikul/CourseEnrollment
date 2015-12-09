$(document).ready(function(){
    //$('#result-form').toggle();
    $('.update-cgpa').click(function(){
        var userId = $(this).find('td:eq(0)').text();
        var semesterId = $(this).find('td:eq(1)').text();
        var courseId = $(this).find('td:eq(2)').text();
        var gpa = prompt('Enter a CGPA');
        var $this = $(this);
        //alert(userId);
        //console.log(semesterId.val());
        //console.log(courseId.val());
        $.ajax({
            method: "POST",
            url: "/stores/updateGPA",
            data: {
                user_id: userId,
                course_id: courseId, semester_id: semesterId,
                cgpa: gpa
            }
        }).success(function(data){
            $this.find('td:eq(3)').html(data.cgpa);
        });
    });

    $('#show-form').click(function(e){
        e.preventDefault();
        $('#result-form').toggle();

    });
    $('.form-control').keyup(function()
    {
        var $this = $(this);
        var keyword = $this.value.toString();
        if (keyword.length > 0)
        {

        }
    });
});