class BST
    attr_accessor :data, :right, :left

    def initialize(data)
        @data = data
    end

    def insert(n)
        if n <= @data
            if @left.nil?
                @left = BST.new(n)
            else
                @left.insert(n)
            end
        else
            if @right.nil?
                @right = BST.new(n)
            else
                @right.insert(n)
            end
        end
    end

    def each(&block)
        # iterate over smallest first (recursive)
        @left.each(&block) if @left
        # call current block after smaller left most blocks have been called
        block.call(@data)
        # iterate over largest last (recursive)
        right.each(&block) if @right
    end
end