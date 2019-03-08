const QTasksList = `
  SELECT
    t.id, t.title, t.description, t.create_at
  FROM tasks t
`;
const QEditTask = `
  UPDATE tasks SET title = ? WHERE id = ?
`;
const QAddTask = `
  INSERT INTO  tasks (title, description, create_at) VALUES (?,?,?)
`;
const QDellTask = `
  DELETE FROM tasks WHERE id = ?
`;

module.exports.QTasksList = QTasksList;
module.exports.QAddTask = QAddTask;
module.exports.QDellTask = QDellTask;
module.exports.QEditTask = QEditTask;