category_acc = zeros(1, 10);
most_confused = zeros(1, 10);

for i = 0:9
    I_labels = find(labels == i);
    [m_I_labels, ~] = size(I_labels);
    I_pred = find(pred == i);
    should_be_i = pred(I_labels);
    M = mode(should_be_i(should_be_i~=i));
    most_confused(i+1) = M;
    [m_intersect, ~] = size(intersect(I_labels, I_pred));
    category_acc(i+1) = m_intersect/m_I_labels;
end

