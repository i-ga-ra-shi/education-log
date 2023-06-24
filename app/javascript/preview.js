function preview() {
    // 公開されている記事がクリックされたときに非公開にする
    const publicButtonChecked = document.querySelectorAll(".public-button-checked");
    for (const checked of publicButtonChecked) {
        checked.addEventListener('click', function(){
            const deleteFlg = window.confirm('投稿を非公開にしますか？');
            if(deleteFlg) {
                // ボタンを作成する
                const newButtonUnchecked = document.createElement('div');
                newButtonUnchecked.className = 'form-check form-switch p-0';
                newButtonUnchecked.innerHTML = `
                <input class="form-check-input public-button public-button-unchecked" type="checkbox" id="flexSwitchCheckDefault">
                <label class="form-check-label" for="flexSwitchCheckDefault"></label>
                `;

                // ボタンを入れ替える
                checked.parentNode.replaceChild(newButtonUnchecked, checked);
                checked.remove();

                // ボタンをクリックしてリクエストを送信
                newButtonUnchecked.click();

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
                // ボタンを作成する
                const newButtonChecked = document.createElement('div');
                newButtonChecked.className = 'form-check form-switch p-0';
                newButtonChecked.innerHTML = `
                <input class="form-check-input public-button public-button-checked" type="checkbox" id="flexSwitchCheckDefault" checked>
                <label class="form-check-label" for="flexSwitchCheckDefault"></label>
                `;

                // ボタンを入れ替える
                unchecked.parentNode.replaceChild(newButtonChecked, unchecked);
                unchecked.remove();

                // ボタンをクリックしてリクエストを送信
                newButtonChecked.click();
                
            } else {
                ;
            }
        })
    }
}

window.addEventListener("load", preview);
