window.addEventListener("pageLoad", function(evt) {
    //alert(evt.detail);
    alert('pageName: '+evt.detail.pageName);
    alert('siteSectionL1: '+evt.detail.siteSectionL1);
    alert('siteSectionL2: '+evt.detail.siteSectionL2);
    alert('siteSectionL3: '+evt.detail.siteSectionL3);
    alert('website: '+evt.detail.website);
    alert('businessUnit: '+evt.detail.businessUnit);
  
}, false);

 //Dispatch an event
 var evt = document.createEvent('CustomEvent');
 evt.initCustomEvent('pageLoad', true, true, {detail: { pageName: "uhc:mr:med-adherence:pharmacy-chat", siteSectionL1: "med-adherence", siteSectionL2: "",
siteSectionL3: "", website: "mr", businessUnit: "uhc"  }});
window.dispatchEvent(evt);


