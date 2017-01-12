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
      cookieName: '',
      cookiePassword: '',
      // cookie: '',
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
              // console.log(response);
            }, error => {
              // console.log(error);
            });
        this.showModal = !this.showModal
        var cookie = this.userCookie()
        this.cookie = cookie
        console.log("AJAX Cookie " + cookie);
      },
      togglePopup: function(){
        if (this.counter < 1){
          this.showModal = true;
          this.counter++;
        }
        userName = this.readCookie()
        // console.log("Toggle Cookie " + userName);
        // if (userName !== ''){
        //   this.showModal = false;
        // }
      },
      randomPassword: function(){
        var chars = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
        var length = 32;
        console.log("cookiePassword Before Loop " + this.cookiePassword);
        for (var i = length; i > 0; --i) this.cookiePassword += chars[Math.round(Math.random() * (chars.length - 1))];
          console.log("cookiePassword In Loop " + this.cookiePassword);
        return this.cookiePassword;
        console.log("cookiePassword After Loop " + this.cookiePassword);
      },
      randomName: function(){
        var chars="0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
        var length = 12;
        console.log("cookieName Before Loop " + this.cookieName);
        for (var i = length; i > 0; --i) this.cookieName += chars[Math.round(Math.random() * (chars.length - 1))];
          console.log("cookieName In Loop " + this.cookieName);
        return this.cookieName;
        console.log("cookieName After Loop " + this.cookieName);
      },
      userCookie: function(){
        var userPassword = this.randomPassword()
        var userName = this.randomName()
        
        var date = new Date();
        date.setTime(date.getTime() + (7 * 24 * 60 * 60 * 100000));
        var expires = "; expires= " + date.toGMTString();

        console.log("Cookie Password " + userPassword);
        console.log("Cookie Name " + userName);
        console.log("Date " + date);
        console.log("Expires " + expires);
       
        document.cookie = userName + " = " + userPassword + expires + "; path=/";
        console.log("Cookie " + document.cookie);
        var cookie = document.cookie;
        return userName;
      },
      readCookie: function(){
        var name = this.userCookie()
        console.log("readCookie " + name);

        var nameEQ = name + "=";
        var ca = document.cookie.split(';');
        for(var i=0;i < ca.length;i++) {
          var c = ca[i];
          while (c.charAt(0)==' ') c = c.substring(1,c.length);
          if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
        }
        return "";
      },
      // setupCookie: function(){
      //   var userCookie = this.userCookie()
      //   var userName = this.userName()

      //   if (userName == ''){

      //   }
      // }
    }
  })
})
