// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"
import Swal from "sweetalert2";

const buttons = document.querySelectorAll(".confirm-button");
const form = document.querySelector("#simple_form");
const confirmButtons = document.querySelectorAll('.confirmSubmit');

buttons.forEach(button => {
  button.addEventListener("click", (event) => {
    // Do something (callback)
    // alert("Hello there! This is a popup window.");
    event.preventDefault();
    Swal.fire({
      title: "Do you want to save the changes?",
      showDenyButton: true,
      showCancelButton: true,
      confirmButtonText: "Save",
      denyButtonText: `Don't save`
    }).then((result) => {
      /* Read more about isConfirmed, isDenied below */
      if (result.isConfirmed) {
        form.submit();
        Swal.fire("Saved!", "", "success");
      } else if (result.isDenied) {
        Swal.fire("Changes are not saved", "", "info");
      }
    });
  });
});

// Confirm popup for jobs/show page
document.addEventListener('DOMContentLoaded', () => {
  const confirmButton = document.querySelector('.confirmSubmit'); // Correct selector
  const form = document.querySelector('#bookingForm');

  if (confirmButton && form) {
    confirmButton.addEventListener('click', (event) => {
      event.preventDefault();
      Swal.fire({
        title: "Do you want to book this job?",
        showDenyButton: true,
        showCancelButton: true,
        confirmButtonText: "Confirm",
        denyButtonText: `Don't book`
      }).then((result) => {
        if (result.isConfirmed) {
          form.submit();
        } else if (result.isDenied) {
          Swal.fire("Changes are not saved", "", "info");
        }
      });
    });

    // Handle the form submission response
    form.addEventListener('ajax:success', (event) => {
      event.preventDefault();
      const [data, status, xhr] = event.detail;
      Swal.fire({
        title: 'Success!',
        text: 'Booking was successfully created.',
        icon: 'success',
        confirmButtonText: 'OK'
      }).then((result) => {
        if (result.isConfirmed) {
          window.location.href = data.redirect_url; // Redirect to the job path
        }
      });
    });

    form.addEventListener('ajax:error', (event) => {
      Swal.fire("Error!", "There was a problem saving your changes.", "error");
    });
  }
});