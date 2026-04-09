using CatalogService from '../../srv/cat-service';
using {toadslop.bookshop as bookshop} from '../../db/index';

annotate bookshop.Books with {
    author @title: 'Author';
    genre  @title: 'Genre';
}

annotate CatalogService.Books with @(UI: {
    HeaderInfo         : {
        TypeName      : 'Book',
        TypeNamePlural: 'Books',
    },
    PresentationVariant: {
        Text          : 'Default',
        SortOrder     : [{Property: title}],
        Visualizations: ['@UI.LineItem']
    },
    LineItem           : [
        {
            Value: title,
            Label: 'Title'
        },
        {
            Value: author,
            Label: 'Author'
        },
        {
            Value: genre,
            Label: 'Genre'
        },
        {
            Value: descr,
            ![@UI.Hidden]
        },
        {
            Value: id,
            ![@UI.Hidden]
        },
    ],
    SelectionFields    : [
        author,
        genre
    ],
});
