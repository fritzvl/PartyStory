// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require_tree .
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require bootstrap-alerts
//= require bootstrap-dropdown
//= require bootstrap-modal
//= require bootstrap-twipsy
//= require bootstrap-popover
//= require bootstrap-scrollspy
//= require bootstrap-tabs
//= require bootstrap-buttons
//= require faye-browser-min
$(function() {
        var client = new Faye.Client('http://localhost:8000/faye');
        client.subscribe("/new_phrases", function(message) {
            console.log(message);
            var id = message;
            $.getJSON("/phrases/" + id + ".json", "", function(data) {
                console.log(data);
                var image = $("<img/>").attr("src", data.phrase.photo_url);
                if ($("#phrase_" + id).length == 0) {
                    var container = $("<div></div>").attr("class", "tile").attr("id", "phrase_" + id);
                    container.appendTo(".tiles");
                }
                $("#phrase_" + id).html(" ");
                image.appendTo("#phrase_" + id);
                $("<span></span>").html(data.phrase.author).appendTo("#phrase_" + id);
                var author = $("#phrase_" + id + "> span");
                author.html(data.phrase.author);

            });

        });
        client.subscribe("/new_blank", function(message) {
            console.log(message);
            var id = message;
            if ($("#phrase_" + id).length == 0) {
                var container = $("<div></div>").attr("class", "tile").attr("id", "phrase_" + id);

                if ($(".tiles > div").length%4 ==0){
                    container.addClass("clear");
                }


                var image = $("<img/>").attr("src", "/photos/medium/missing.png");
                image.appendTo(container);
                var author = $("<span></span>");
                author.appendTo(container);
                container.appendTo(".tiles");
                console.log($("#phrase_" + id));
            }

        });


        if (UPIACH) {
            $(function() {
                $.getJSON("/phrases.json", "", function(data) {
                        data_length = data.length;
                        var inter = [];
                        for (var i = 0; i < data.length; i++) {
                            var slider = function(i) {
                                return function() {
                                    var img = $("<img/>").attr("src", data[i].phrase.photo_url_medium);
                                    $("#upiach-showplace").html("");
                                    img.appendTo("#upiach-showplace");

                                }
                            }

                            inter[i] = setInterval(slider(i), 1000 + i * 100);
                        }

                        $("#stop").click(
                            function() {
                                for (var i = 0; i < data_length; i++) {
                                    clearInterval(inter[i]);
                                }

                                console.log("Stopped")
                            }
                        );


                    }
                );


            });
            $("#audio1").get(0).play();
        }
        ;

        if (!UPIACH) {
            $.getJSON("/phrases.json", "", function(data) {
                for (var i = 0; i < data.length; i++) {
                    var container = $("<div></div>").attr("id", "phrase_" + data[i].phrase.id);
                    if (i % 4 == 0)
                        container.addClass("clear");

                    var image = $("<img/>").attr("src", data[i].phrase.photo_url_medium);
                    console.log(image);
                    image.appendTo(container);

                    var author = $("<span></span>");
                    author.html(data[i].phrase.author);
                    author.appendTo(container);

                    container.appendTo(".tiles");
                }
            });
        }


    }
)
    ;


