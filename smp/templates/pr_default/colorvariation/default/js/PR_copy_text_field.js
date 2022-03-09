// テキストフィールドに入力した内容を別のフィールドにコピー
function modifyFunc(obj,targetName){
	var target=obj.form.elements[targetName];
	target.value=obj.value;
}
