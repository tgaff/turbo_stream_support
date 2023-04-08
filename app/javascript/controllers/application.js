import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

// addEventListener("turbo:before-stream-render", ((event) => {
//   const fallbackToDefaultActions = event.detail.render

//   event.detail.render = function (streamElement) {
//     /* optional other logic or processing before
//        conditionally handing off to default render
//     */
//     fallbackToDefaultActions(streamElement)
//   }
// }))