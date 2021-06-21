import { Controller } from "stimulus"
  
export default class extends Controller {
  static targets = ["entries", "scroller", "search", "nextpage", "recordCount"]

  initialize() { 
    let options = {
      root: this.scrollerTarget,
      rootMargin: '200px',
    }     

    this.intersectionObserver = new IntersectionObserver(entries => this.processIntersectionEntries(entries), options)    
  }

  connect() { this.intersectionObserver.observe(this.nextpageTarget) }
    
  disconnect() { this.intersectionObserver.unobserve(this.nextpageTarget) }

  processIntersectionEntries(entries) {
    entries.forEach(entry => {
      if (entry.isIntersecting) this.load();
    })
  }

  load(replace = false) {
    let next_page
    if ( (next_page = (replace ? 0 : this.nextpageTarget.dataset.nextPage)) == "null") return;

    let url = this.nextpageTarget.dataset.url;

    Rails.ajax({
      type: 'GET',
      url: url,
      dataType: 'json',
      data: jQuery.param( {
        page: next_page,
        search: this.searchTarget.value
      }),
      success: (data) => {
        if (replace) {
          this.entriesTarget.innerHTML = data.entries
          this.scrollerTarget.scrollTop = 0
        }
        else this.entriesTarget.insertAdjacentHTML('beforeend', data.entries)
        this.nextpageTarget.dataset.nextPage = data.nextPage
        this.recordCountTarget.innerHTML = data.recordCount
      }
    })
  }
}
