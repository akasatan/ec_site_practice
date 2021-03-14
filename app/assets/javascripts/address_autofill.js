
$(function () {
  $(document).on('turbolinks:load', () => {
    $('#user_postcode').jpostal({
      postcode: ['#user_postcode'],
      address: {"#user_address": "%3%4%5%6%7"}
    });
  });
});