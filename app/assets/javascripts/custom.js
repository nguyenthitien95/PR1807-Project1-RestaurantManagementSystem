$(document).ready(function () {
  /*[ Show/hide sidebar ]
  ===========================================================*/
  $('body').append('<div class="overlay-sidebar trans-0-4"></div>');
  var ovlSideBar = $('.overlay-sidebar');
  var btnShowSidebar = $('.btn-show-sidebar');
  var sidebar = $('.sidebar');

  $(btnShowSidebar).on('click', function(){
    console.log("show sidebar");
    $(sidebar).addClass('show-sidebar');
    $(ovlSideBar).addClass('show-overlay-sidebar');
  });

  $(ovlSideBar).on('click', function(){
    console.log("hide sidebar");
    $(sidebar).removeClass('show-sidebar');
    $(ovlSideBar).removeClass('show-overlay-sidebar');
  });

  var select_image = document.getElementById("select-img");
  var image_preview = document.getElementById("img-preview");
  if(select_image){
    if(select_image.files[0] != ""){
      image_preview.style.visibility = "visible";
    }
    select_image.addEventListener("change", function(){
      image_preview.style.visibility = "visible";
      var tmppath = URL.createObjectURL(select_image.files[0]);
      image_preview.setAttribute("src", tmppath);
    });
  }
});

function dish_quantity_sub(){
  var quantity = document.getElementById('dish-quantity');
  if(quantity.innerHTML == '0') return;
  quantity.innerHTML = parseInt(quantity.innerHTML) - 1;
  // $('#dish-quantity').innerHTML = parseInt($('#dish-quantity').innerHTML) + 1;
}

function dish_quantity_add(){
  var quantity = document.getElementById('dish-quantity');
  if(quantity.innerHTML == '1000') return;
  quantity.innerHTML = parseInt(quantity.innerHTML) + 1;
  // $('#dish-quantity').innerHTML = parseInt($('#dish-quantity').innerHTML) + 1;
}
