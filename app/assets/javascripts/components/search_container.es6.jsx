class SearchContainer extends React.Component {
  constructor(props) {
    super(props)

    this.state = { preventHideDropdown: false, showDropdown: false, term: '', items: [] }
    this.hideDropdown = this.hideDropdown.bind(this);
    this.showDropdown = this.showDropdown.bind(this);
    this.setPreventHideDropdown = this.setPreventHideDropdown.bind(this);
    this.resetPreventHideDropdown = this.resetPreventHideDropdown.bind(this);
  }

  search(term) {
    this.setState({ term });

    $.ajax({
      url: `/api/items.json/?items=${term}`,
      method: 'GET',
      success: (data) => { this.setState({
        items: data.items,
      });}
    });
  }

  setPreventHideDropdown() {
    this.setState({ preventHideDropdown: true });
  }

  resetPreventHideDropdown() {
    this.setState({ preventHideDropdown: false });
  }

  hideDropdown() {
    if (!this.state.preventHideDropdown) {
      this.setState({ showDropdown: false });
    }
  }

  showDropdown() {
    this.setState({ showDropdown: true });
  }

  render () {
    return (
      <div>
        <SearchBar 
          showDropdown={this.showDropdown}
          hideDropdown={this.hideDropdown}
          term={this.state.term} 
          onSearchTermChange={(term) => {this.search(term)}}
        />
        {this.renderSearchResults()}
      </div>
    );
  }

  renderSearchResults() {
    if(!this.state.showDropdown || this.state.items.length === 0 ) {
      return;
    }

    return (
      <SearchResultsList
        setPreventHideDropdown={this.setPreventHideDropdown}
        resetPreventHideDropdown={this.resetPreventHideDropdown}
        term={this.state.term}
        item={this.state.items}
      />
    );
  }
}

