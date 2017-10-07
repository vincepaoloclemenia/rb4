class SearchResultsList extends React.Component {

  render() {
    return (
      <ul className="dropdown-menu" id="autocomplete-items" onMouseEnter={() => {this.props.setPreventHideDropdown()}} onMouseLeave={() => {this.props.resetPreventHideDropdown()}}>
        <span className="dropdown-arrow-top"></span>
        <span className="dropdown-arrow-bottom"></span>
        <li>
          <a href={`/search?q=${this.props.term}`}>
            <i className="fa fa-search"></i> Search for <strong>{this.props.term}</strong>
          </a>
        </li>       
        {this.renderItems()}
      </ul>
    );
  }

  renderItems() {
   return this.props.items.slice(0, 3).map((item) => {
      return <SearchItemListItem key={item.id} item={item} />
    });
  }

}

