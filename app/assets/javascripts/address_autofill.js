$(function() {
  return $('#restaurant_postcode').jpostal({
    postcode: ['#restaurant_postcode'],
    address: {
      '#restaurant_prefecture_code': '%3',
      '#restaurant_address_city': '%4',
      '#restaurant_address_street': '%5%6%7',
    },
  });
});