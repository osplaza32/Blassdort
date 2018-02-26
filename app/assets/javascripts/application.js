// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require dist/dropzone.js
//= require moment
//= require jquery.fittext.js
//= require jquery.min.js


//= require jquery
//= require jquery/jquery-2.1.1.js
//= require bootstrap-sprockets
//= require metisMenu/jquery.metisMenu.js
//= require pace/pace.min.js
//= require slimscroll/jquery.slimscroll.min.js
//= require_tree .
$( document ).ready(function() {

    function update() {
        $('#clock').html(moment().format('DD/MM/YYYY H:mm:ss'));
    }

    setInterval(update, 1000);}
);

var loadFile = function(event) {
    var reader;
        reader = new FileReader;
        reader.onload = function() {
                var output;
                output = document.getElementById('output');
                output.src = reader.result;

                };
        reader.readAsDataURL(event.target.files[0]);
    };