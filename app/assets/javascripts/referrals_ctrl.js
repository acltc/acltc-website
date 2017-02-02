$( document ).ready(function() {
  new Vue({
    el: '#referral',
    data: {
      referrer_first_name: "Your First Name",
      referrer_email: "youremail@email.com",
      referred_first_name: "Your Friend's Name",
      referred_email: "yourfriendsemail@email.com",
      body: "I've been checking out this awesome coding bootcamp calledActualize (http://actualize.co) and I think it would be a really great fit for you. I would like to introduce you to Ben, who is an advisor there, and would be more than happy to answer any questions you may have."
    }
  })
});
