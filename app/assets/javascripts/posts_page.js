$(".myBox").click(gotoPost(){
     window.location=$(this).find("a").attr("href");
     return false;
});