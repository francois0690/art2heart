import flatpickr from 'flatpickr';

export default function toggleDateInputs() {
    const startDateInput = document.querySelector("#transaction_date_start");
    const endDateInput = document.querySelector('#transaction_date_end');
    if (startDateInput && endDateInput) {
        const unvailableDates = JSON.parse(document.querySelector('#piece-booking-dates').dataset.unavailable)
        flatpickr(startDateInput, {
            minDate: 'today',
            dateFormat: 'Y-m-d',
            disable: unvailableDates,
            onChange: function(selectedDates, selectedDate) {
                if (selectedDate === '') {
                    endDateInput.disabled = true;
                }
                let minDate = selectedDates[0];
                minDate.setDate(minDate.getDate() + 1);
                endDateCalendar.set('minDate', minDate);
                endDateInput.disabled = false;
            }
        });
        const endDateCalendar =
            flatpickr(endDateInput, {
                dateFormat: 'Y-m-d',
                disable: unvailableDates,
            }, );
    }
};