function preview() {
    const formCheckInput = document.querySelectorAll(".public-button")

    formCheckInput.forEach( function(check) {
        check.addEventListener('mouseover', function(){
        console.log(check)
        })
    })

};

window.addEventListener("load", preview);