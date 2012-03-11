// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require jquery-ui
//= require_tree .

$(function() {
  $("#commute_commute_date").datepicker({ dateFormat: 'yy-mm-dd' });
  });

$(function() {
	$("#company_type").hide();
	$("#company_size").hide();
		})


$(function() {
  $("#team_checkbox").click(function(){
	$("#company_type").toggle();
	$("#company_size").toggle();
		})
  });