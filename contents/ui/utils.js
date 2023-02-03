function colorAlpha(color, alpha) {
    return Qt.rgba(color.r, color.g, color.b, alpha);
}

function hasWindows(pageModel) {
    if (pageModel.TasksModel === undefined) {
        return false;
    }
    return pageModel.TasksModel.hasChildren();
}

function updatePageState(pageModel, pageItem) {
    pageItem.hasWindows = hasWindows(pageModel);
}
