function [accuracy, loss, confusion] = evaluate(output, target)
test_size = size(target, 1);
loss = sum(output ~= target);
accuracy = (1 - (loss / test_size)) * 100;
confusion = confusionmat(target, output);
end