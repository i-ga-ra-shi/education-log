function preview() {
    const formCheckInput = document.querySelectorAll(".public-button")

    formCheckInput.forEach( function(check) {
        check.addEventListener('click', function(){

            if (check.checked) {
            console.log(check.checked)
            check.remove
        } else{

        }
        })
    })
};

window.addEventListener("load", preview);