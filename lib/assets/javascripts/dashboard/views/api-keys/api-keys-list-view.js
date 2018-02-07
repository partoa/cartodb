const CoreView = require('backbone/core-view');
const ApiKeysCollection = require('dashboard/data/api-keys-collection');
const checkAndBuildOpts = require('cartodb3/helpers/required-opts');
const template = require('./api-keys-list.tpl');
const ApiKeysListItemView = require('dashboard/views/api-keys/api-keys-list-item-view');

const REQUIRED_OPTS = [
  'stackLayoutModel',
  'userModel'
];

module.exports = CoreView.extend({
  events: {
    'click .js-add': '_onAddClick'
  },

  initialize: function (options) {
    checkAndBuildOpts(options, REQUIRED_OPTS, this);

    this._apiKeysCollection = new ApiKeysCollection(null, {
      userModel: this._userModel
    });

    this._initBinds();

    this._onEdit = this._onEdit.bind(this);

    this._apiKeysCollection.fetch();
  },

  _initBinds: function () {
    this.listenTo(this._apiKeysCollection, 'add change remove', this.render);
  },

  render: function () {
    this.clearSubViews();

    this.$el.html(template());
    this._renderKeys();

    return this;
  },

  _renderKeys: function () {
    const keys = [
      // this._apiKeysCollection.getMasterKey(),
      // this._apiKeysCollection.getDefaultKey(),
      ...this._apiKeysCollection.getRegularKeys()
    ];

    keys.forEach(apiKeyModel => {
      const view = new ApiKeysListItemView({
        apiKeyModel,
        onEdit: this._onEdit
      });

      this.addView(view);

      this.$('.js-api-keys-list').append(view.render().el);
    });
  },

  _onAddClick: function () {
    this._stackLayoutModel.goToStep(1);
  },

  _onEdit: function (apiKeyModel) {
    this._stackLayoutModel.goToStep(1, apiKeyModel);
  }
});