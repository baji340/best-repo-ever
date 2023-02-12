let ele = document.getElementByTagName('button');
alert(ele);
     let numOfClick = 0;
if(ele){
     ele[0].addEventListener('click', function() {
      numOfClick = numOfClick + 1;
      alert('numOfClick :'+numOfClick );
    });
}