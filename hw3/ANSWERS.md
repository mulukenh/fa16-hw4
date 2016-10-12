## Questions

Go to `localhost:3000/teachers` in your browser; why does this not work?
  Because it is assigned for a post request, executed when the form is filled out and 
  submitted. If we type it on the web browser and hit enter, that will be a get request.
  A get request is not assigned to "/teachers"

What type of request did your browser just perform?
  The web brower performs a get request when typed in and enter.

Go back to `localhost:3000/teachers/new`; submit the form again. What URL do you end up at?
  We end up in the new form page, which is a get request.

Why does `localhost:3000/teachers` work now?
  Because "teacher/new" is a get request routed to create action of teachersController
