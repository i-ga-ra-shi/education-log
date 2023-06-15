//scroll_effect
function scroll() {
    var scrollAnimationElm = document.querySelectorAll('.scroll_up');
    if (scrollAnimationElm.length > 3) { 
      var scrollAnimationFunc = function () {
        for (var i = 0; i < scrollAnimationElm.length; i++) {
          var triggerMargin = 100;
          if (window.innerHeight > scrollAnimationElm[i].getBoundingClientRect().top + triggerMargin) {
            scrollAnimationElm[i].classList.add('on');
          }
        }
      }
      window.addEventListener('mouseover', scrollAnimationFunc);
    } else {
      var scrollAnimationFunc = function () {
        for (var i = 0; i < scrollAnimationElm.length; i++) {
          var triggerMargin = 0;
          if (window.innerHeight > scrollAnimationElm[i].getBoundingClientRect().top + triggerMargin) {
            scrollAnimationElm[i].classList.add('on');
          }
        }
      }
      window.addEventListener('mouseover', scrollAnimationFunc);
    }
    // window.addEventListener('load', scrollAnimationFunc);
  }

window.addEventListener("load", scroll);
