$(document).ready(function(){
    $('.semester-select').change(function(){
        var selectedOption = $(this).find("option:selected");
        $.ajax({
            method: "GET",
            url: "/semesters/getCourses",
            data: { id: selectedOption.val() }
        })
        .success(function( data ) {
            console.log(data);
        });
    });
});

