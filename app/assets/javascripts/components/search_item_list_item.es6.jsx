class SearchItemListItem extends React.Component {
  render() {
    return (
      <li>
        
          <span dangerouslySetInnerHTML={{ __html: this.props.item.name }} />
        
      </li>
    );
  }
}

