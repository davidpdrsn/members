class PaginatedRelation
  def initialize(relation:, per_page:)
    @relation = relation
    @per_page = per_page
  end

  def page(page_number)
    Page.new(
      relation: @relation,
      per_page: @per_page,
      page_number: page_number,
    )
  end

  class Page
    def initialize(relation:, per_page:, page_number:)
      @relation = relation
      @per_page = per_page
      @page_number = page_number
    end

    include Enumerable

    def size
      @relation.size
    end

    def total_number_of_pages
      size.fdiv(@per_page).ceil
    end

    def each
      records = @relation
        .limit(@per_page)
        .offset(@page_number * @per_page)

      records.each do |record|
        yield record
      end
    end

    def index_of_next_page
      @page_number + 1
    end

    def next
      self.class.new(
        relation: @relation,
        per_page: @per_page,
        page_number: index_of_next_page,
      )
    end

    def index_of_previous_page
      @page_number - 1
    end

    def previous
      self.class.new(
        relation: @relation,
        per_page: @per_page,
        page_number: index_of_previous_page,
      )
    end

    def previous_page?
      index_of_previous_page >= 0
    end

    def next_page?
      (index_of_next_page + 1) <= total_number_of_pages
    end

    def current_page_index
      @page_number
    end
  end
end
