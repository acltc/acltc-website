$(document).on('ready', function() {
   new Vue({
     el: "#pdf-sticky-footer",
     data: {
      message: "hello foot face",
      showCareerDownload: false
     },
     methods:{
      toggleCareerDownload: function(){
        this.showCareerDownload = !this.showCareerDownload;
        if (this.showCareerDownload){
          var closeButton = document.getElementById("sticky-footer-button");
          closeButton.innerHTML = "Close";
        }
        else {
          var closeButton = document.getElementById("sticky-footer-button");
          closeButton.innerHTML = "Learn More";
        }
      }
     }
   })
})

