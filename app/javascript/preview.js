function preview() {
    const publicButtonChecked = document.querySelectorAll(".public-button-checked");
    for (const checked of publicButtonChecked) {
        checked.addEventListener('click', function(){
            const deleteFlg = window.confirm('投稿を非公開にしますか？');
            if(deleteFlg) {
                const newElement = document.createElement('div');
                newElement.className = 'form-check form-switch p-0';
                newElement.innerHTML = `
                <input class="form-check-input public-button public-button-unchecked" type="checkbox" id="flexSwitchCheckDefault">
                <label class="form-check-label" for="flexSwitchCheckDefault"></label>
                `;
                checked.parentNode.replaceChildren(newElement, checked);
                checked.remove();
            }else {
                ;
            }
        })
    }

    const publicButtonUnchecked = document.querySelectorAll(".public-button-unchecked");
    for (const unchecked of publicButtonUnchecked) {
        unchecked.addEventListener('click', function(){
            const publicFlg = window.confirm('投稿を公開しますか？');
            if(publicFlg) {
                const newElement = document.createElement('div');
                newElement.className = 'form-check form-switch p-0';
                newElement.innerHTML = `
                <input class="form-check-input public-button public-button-checked" type="checkbox" id="flexSwitchCheckDefault" checked>
                <label class="form-check-label" for="flexSwitchCheckDefault"></label>
                `;
                unchecked.parentNode.replaceChildren(newElement, unchecked);
                unchecked.remove();
            } else {
                ;
            }
        })
    }
}

window.addEventListener("load", preview);
