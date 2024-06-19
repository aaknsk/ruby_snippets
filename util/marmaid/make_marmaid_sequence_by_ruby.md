
### sample code

Step 1: TracePointを使ったメソッドトレース
TracePointはRubyで提供されているクラスで、メソッドの呼び出し、戻り、例外の発生などのイベントをフックすることができます。これを使って、特定のメソッドの呼び出しをトレースします。

Step 2: Mermaid形式のシーケンス図生成
収集したメソッド呼び出し情報をもとに、Mermaid形式のシーケンス図文字列を生成します。

以下は、ライブラリの実装例です。
```ruby
class MermaidSequenceDiagram
  def initialize
    @calls = []
    @stack = []
  end

  def trace_method(method_name)
    TracePoint.trace(:call, :return) do |tp|
      if tp.defined_class.to_s.include?('MermaidSequenceDiagram')
        next
      end
      
      if tp.event == :call && tp.method_id == method_name
        @stack.push("#{tp.defined_class}##{tp.method_id}")
      elsif tp.event == :return && tp.method_id == method_name
        called_method = @stack.pop
        next_method = @stack.last
        @calls << { from: next_method, to: called_method } if next_method
      end
    end
  end

  def to_mermaid
    diagram = "sequenceDiagram\n"
    @calls.each do |call|
      from = call[:from].gsub('#', ':')
      to = call[:to].gsub('#', ':')
      diagram += "#{from} ->> #{to}: call\n"
    end
    diagram
  end
end

# 使用例
diagram = MermaidSequenceDiagram.new
diagram.trace_method(:target_method) # ここに追跡したいメソッド名を入れる
# 追跡したいメソッドの実行コードをここに書く
puts diagram.to_mermaid

```

### how to use
1. 初期化: MermaidSequenceDiagram クラスをインスタンス化します。
2. メソッドのトレース開始: trace_method メソッドに追跡したいメソッド名を渡して呼び出します。
3. メソッドの実行: 追跡したいメソッドを実行します。
4. Mermaid形式のシーケンス図出力: to_mermaid メソッドを呼び出してシーケンス図を出力します。

```ruby
class User
  def update
    # 更新処理
  end

  def notify
    # 通知処理
  end
end

diagram = MermaidSequenceDiagram.new
diagram.trace_method(:update)
user = User.new
user.update
puts diagram.to_mermaid
```
