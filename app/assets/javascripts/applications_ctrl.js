$(document).on('ready', function() {
  Vue.component('modal', {
    template: '#modal-template'
  })

  new Vue({
    el: '#app',
    data: {
      message: "Hello World!",
      progressBar: 0,
      answeredQuestions: 0,
      totalQuestions: 13,
      showModal: false,
      counter: 0,
      subscriber: {
        first_name: '',
        email: '',
        mousetrap: 'Popup'
      }
    },
    methods: {
      applicationFields: function(){
        answeredQuestions = 0;
        totalQuestions = 13;

        formFilledIn = document.getElementsByClassName("form-control")
        // radioFilledIn = document.getElementsByClassName("radio")

        for (var i = 0; i < formFilledIn.length; i++){
          if (formFilledIn[i].value !== ""){
            answeredQuestions++;
            console.log("Form Answered Questions " + answeredQuestions);
          }
        }

        // for (var i = 0; i < radioFilledIn.length; i++){
        //   if (radioFilledIn[i].value !== ""){
        //     answeredQuestions++;
        //     console.log("Answered Questions " + answeredQuestions);
        //   }
        // }

        var progress = answeredQuestions/totalQuestions
        // var formFilledIn = document.forms.new_application.application_first_name.value;

        progressBar = (progress * 100) - 1
        console.log("Fields filled in " + answeredQuestions);
        console.log("Fields not filled in " + totalQuestions);
        console.log("Progress Bar " + progressBar);
        this.progressBar = progressBar.toFixed(0);
      },
      newSubscriber: function(){
        this.$http.post('/subscribers_popup.json', this.subscriber).then(response => {
              console.log(response);
            }, error => {
              console.log(error);
            });
        this.showModal = !this.showModal
      },
      // scrollPopup: function() {
      //   window.onscroll = function(){
      //     if (document.body.scrollTop > 5000 || document.documentElement.scrollTop > 5000){
      //       this.showModal = !this.showModal; 
      //     }   
      //   } 
      // },
      togglePopup: function(){
        if (this.counter < 1){
          this.showModal = true;
          this.counter++;
        } 
      }
    }
  })
})
