function preview() {
    // 公開されている記事がクリックされたときに非公開にする
    const publicButtonChecked = document.querySelectorAll(".public-button-checked");
    for (const checked of publicButtonChecked) {
        checked.addEventListener('click', function(){
            const deleteFlg = window.confirm('投稿を非公開にしますか？');
            if(deleteFlg) {
                // ボタンを入れ替える
                const newButton = document.createElement('div');
                newButton.className = 'form-check form-switch p-0';
                newButton.innerHTML = `
                <input class="form-check-input public-button public-button-unchecked" type="checkbox" id="flexSwitchCheckDefault">
                <label class="form-check-label" for="flexSwitchCheckDefault"></label>
                `;
                checked.parentNode.replaceChildren(newButton, checked);
                checked.remove();
                newButton.click();
            } else {
                ;
            }
        })
    }

    // 非公開の記事がクリックされたときに公開する
    const publicButtonUnchecked = document.querySelectorAll(".public-button-unchecked");
    for (const unchecked of publicButtonUnchecked) {
        unchecked.addEventListener('click', function(){
            const publicFlg = window.confirm('投稿を公開しますか？');
            if(publicFlg) {
                const newButton = document.createElement('div');
                newButton.className = 'form-check form-switch p-0';
                newButton.innerHTML = `
                <input class="form-check-input public-button public-button-checked" type="checkbox" id="flexSwitchCheckDefault" checked>
                <label class="form-check-label" for="flexSwitchCheckDefault"></label>
                `;
                unchecked.parentNode.replaceChildren(newButton, unchecked);
                unchecked.remove();
            } else {
                ;
            }
        })
    }
}

window.addEventListener("load", preview);
