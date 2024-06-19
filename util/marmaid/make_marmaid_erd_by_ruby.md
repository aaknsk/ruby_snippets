指定されたRuby on Railsのモデルファイルの関連付けをMermaidのEntity Relationship Diagrams (ERD)形式で出力するライブラリの実装
指定されたモデルから関連付けを探索し、Mermaid形式のERD文字列を生成します。

### ライブラリの実装

#### Step 1: モデル関連の探索

Railsの`reflect_on_all_associations`メソッドを使って、モデルの関連付けを取得します。

#### Step 2: Mermaid形式のERD生成

取得した関連付けをもとに、Mermaid形式のERD文字列を生成します。

以下に実装例を示します。

```ruby
class MermaidERDGenerator
  def initialize(models, depth)
    @models = models
    @depth = depth
    @visited = {}
    @edges = []
  end

  def generate
    @models.each do |model|
      explore_model(model, @depth)
    end

    to_mermaid
  end

  private

  def explore_model(model, depth)
    return if depth < 0 || @visited[model]

    @visited[model] = true
    associations = model.reflect_on_all_associations

    associations.each do |association|
      target_model = association.klass
      @edges << "#{model.name} --> #{target_model.name}"

      explore_model(target_model, depth - 1)
    end
  end

  def to_mermaid
    diagram = "erDiagram\n"
    @edges.each do |edge|
      diagram += "  #{edge}\n"
    end
    diagram
  end
end

# 使用例
# `User`モデルから2つ先の関連まで探索する場合
generator = MermaidERDGenerator.new([User], 2)
puts generator.generate
```

### 使用方法

1. **初期化**: `MermaidERDGenerator` クラスをインスタンス化します。引数として、探索を開始するモデルの配列と探索の深さを指定します。
2. **ERD生成**: `generate` メソッドを呼び出してERD文字列を生成します。

### 例

例えば、`User`モデルから2つ先の関連を探索する場合、以下のように使用します。

```ruby
# `User`モデルから2つ先の関連まで探索する場合
generator = MermaidERDGenerator.new([User], 2)
puts generator.generate
```

このコードを実行すると、`User`モデルから始まる関連付けを探索し、Mermaid形式のERD文字列が生成されます。

### 参考文献

- [Mermaid公式ドキュメント](https://mermaid.js.org/syntax/entityRelationshipDiagram.html)
- [Rails APIドキュメント: reflect_on_all_associations](https://api.rubyonrails.org/classes/ActiveRecord/Reflection/ClassMethods.html#method-i-reflect_on_all_associations)
