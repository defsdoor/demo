import { Controller } from "stimulus"
  
export default class extends Controller {
  static targets = ["entries", "nextpage"]

  initialize() { 
    let options = {
      rootMargin: '200px',
    }     

    this.intersectionObserver = new IntersectionObserver(entries => this.processIntersectionEntries(entries), options)    
  }

  connect() { this.intersectionObserver.observe(this.nextpageTarget) }
    
  disconnect() { this.intersectionObserver.unobserve(this.nextpageTarget) }

  processIntersectionEntries(entries) {
    entries.forEach(entry => {
      if (entry.isIntersecting) this.loadMore();
    })
  }

  loadNew() {
    let url = this.nextpageTarget.dataset.url;
    Rails.ajax({
      type: 'GET',
      url: url,
      dataType: 'json',
      data: jQuery.param( {
        search: document.getElementById('productSearch').value
      }),
      success: (data) => {
        this.entriesTarget.innerHTML = data.entries
        this.nextpageTarget.dataset.nextPage = data.nextPage
      }
    })
  }

  loadMore() {
    let next_page = this.nextpageTarget.dataset.nextPage;
    if (next_page == "null") { return }
    let url = this.nextpageTarget.dataset.url;

    Rails.ajax({
      type: 'GET',
      url: url,
      dataType: 'json',
      data: jQuery.param( {
        page: next_page,
        search: document.getElementById('productSearch').value
      }),
      success: (data) => {
        this.entriesTarget.insertAdjacentHTML('beforeend', data.entries)
        this.nextpageTarget.dataset.nextPage = data.nextPage
      }
    })
  }
}
