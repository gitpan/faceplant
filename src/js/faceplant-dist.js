
   // $Id: faceplant-dist.js,v 1.2 Apr 15 05:33:23 CDT 2004 rhizo Exp $
  //  Accomodates the Photo Size Chooser feature

         var i,n;

         function prop(i,n)
         {
                 var f;
                 if(document.all){f=eval('document.all.photo_scale_chooser');} // IE
                 else{f=document.getElementById('photo_scale_chooser');}      // DOM

                 if(n) // pager or thumb onClick 
                 {     
                     f.action=i+'?page='+n;
                 }     
                 else // sub-gallery or breadcrumb onClick
                 {
                     f.action=i;
                 }
                 f.submit();
                 return false;
         }

