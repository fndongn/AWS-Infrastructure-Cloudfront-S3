/* =========================================================
   NORTHSTAR ORTHODONTICS
   Main JavaScript
   ========================================================= */


/* ================= MOBILE NAVIGATION ================= */

const mobileMenuButton =
    document.getElementById(
        "mobileMenuButton"
    );

const navLinks =
    document.getElementById(
        "navLinks"
    );


if (
    mobileMenuButton &&
    navLinks
) {

    mobileMenuButton.addEventListener(
        "click",
        () => {

            const isOpen =
                navLinks.classList.toggle(
                    "active"
                );

            mobileMenuButton.setAttribute(
                "aria-expanded",
                isOpen
            );

        }
    );


    /*
     * Close the mobile menu after
     * clicking a navigation link.
     */

    navLinks
        .querySelectorAll("a")
        .forEach(
            (link) => {

                link.addEventListener(
                    "click",
                    () => {

                        navLinks.classList.remove(
                            "active"
                        );

                        mobileMenuButton.setAttribute(
                            "aria-expanded",
                            "false"
                        );

                    }
                );

            }
        );

}


/* ================= APPOINTMENT PLACEHOLDER ================= 

const appointmentButton =
    document.getElementById(
        "appointmentButton"
    );


if (appointmentButton) {

    appointmentButton.addEventListener(
        "click",
        (event) => {

            /*
             * Temporary behavior.
             *
             * Later this will be replaced
             * with the Google Appointment
             * Scheduling URL.
             */

            event.preventDefault();

            alert(
                "Online scheduling will be connected in the next stage."*/
            );

        }
    );

}
