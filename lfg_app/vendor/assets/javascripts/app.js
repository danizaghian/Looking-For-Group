$(document).ready(function () {
	console.log("Javascript working!")
	$(".favorite-button").on("mousedown", function(event) {
		var id = $(this).attr('id')
		var button = this
		console.log(id)
		event.preventDefault();
		$.ajax({
			url: "/games/" + id + "/adduser",
			method: "POST"
		}).done(function(data){
			console.log("ajax works")
			$(button).addClass("disabled");
			console.log($(button).attr('class'))
		});
	});

	$(".name-search").on("keydown", function(event){
		var val = $(".name-search").val().toUpperCase()
		$('.card-container').each(function(){
			$(this).show()
			if ($(this).attr('id').toUpperCase().indexOf(val)== -1){
				$(this).hide();
			}
		});
	});

	$(".message").css('cursor','pointer');


	$(".message").on('click', function(e){
		e.preventDefault();
	})

});