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
      dateExpires: '',
      cookie: '',
      subscriber: {
        first_name: '',
        email: '',
        phone: '',
        mousetrap: 'Popup'
      },
      subscribers: [],
      errors: {}
    },
    mounted: function(){
      that = this;
      setTimeout(function(){
        that.loadPopup()
      }, 10000)
    },
    methods: {
      applicationFields: function(){
        answeredQuestions = 0;
        totalQuestions = 13;

        formFilledIn = document.getElementsByClassName("form-control")

        for (var i = 0; i < formFilledIn.length; i++){
          if (formFilledIn[i].value !== ""){
            answeredQuestions++;
          }
        }
       
        var progress = answeredQuestions/totalQuestions
        progressBar = (progress * 100) - 1
        this.progressBar = progressBar.toFixed(0);
      },
      loadPopup: function(){
        var readTheCookie = this.readCookieName()
        if (readTheCookie !== null){

          this.showModal = false;
        } else if (readTheCookie === null){
          this.showModal = true;
        }
      },
      newSubscriber: function(){
        this.$http.post('/api/v1/subscribers_popup.json', this.subscriber).then(function(response) {
          this.subscribers.push(this.subscriber);
          this.showModal = !this.showModal;
          this.setupCookie();
        }).catch(function(response) {
          this.errors = response.data.errors;
        });
      },
      closePopup: function(){
        this.setupCookie();
        this.showModal = false;
      },
      randomPassword: function(){
        var chars = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
        var length = 32;
        for (var i = length; i > 0; --i) this.cookiePassword += chars[Math.round(Math.random() * (chars.length - 1))];
        return this.cookiePassword;
      },
      randomName: function(){
        var chars="0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
        var length = 12;
        for (var i = length; i > 0; --i) this.cookieName += chars[Math.round(Math.random() * (chars.length - 1))];
        return this.cookieName;
      },
      dateSetup: function(){
        var date = new Date();
        date.setTime(date.getTime() + (7 * 24 * 60 * 60 * 100000));
        var expires = "; expires= " + date.toGMTString();
        this.dateExpires = expires;
        return this.dateExpires;
      },
      userCookie: function(name, password, expires){
        if (this.cookie) {
          return this.cookie;
        } else {
          document.cookie = name + " = " + password + expires + "; path=/";
          this.cookie = document.cookie;
          return this.cookie;
        }
      },
      readCookieName: function(){
        var readCookie = localStorage.getItem("cookie");
        return readCookie;
      },
      setupCookie: function(){
        this.cookiePassword = this.randomPassword();
        this.cookieName = this.randomName();
        this.dateExpires = this.dateSetup();

        var cookie = this.userCookie(this.cookieName, this.cookiePassword, this.dateExpires);
        this.cookie = cookie
        localStorage.setItem("cookie", cookie);
        return cookie;
      }
    }
  })
})