$(".myBox").click(function gotoPost(){
     window.location=$(this).find("a").attr("href");
     return false;
});