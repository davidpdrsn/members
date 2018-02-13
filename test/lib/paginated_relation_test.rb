require "test_helper"

class PaginatedRelationTest < ActiveSupport::TestCase
  test "page count" do
    2.times do
      create :member
    end

    page = PaginatedRelation.new(
      relation: Member.all,
      per_page: 1,
    ).page(0)

    assert_equal 2, page.total_number_of_pages
  end

  test "paginating forwards" do
    create :member, first_name: "one"
    create :member, first_name: "two"
    create :member, first_name: "three"

    page = PaginatedRelation.new(
      relation: Member.all,
      per_page: 1,
    ).page(0)

    assert_equal ["one"], page.map(&:first_name)
    assert_equal ["two"], page.next.map(&:first_name)
    assert_equal ["three"], page.next.next.map(&:first_name)

    next_page = PaginatedRelation.new(
      relation: Member.all,
      per_page: 1,
    ).page(1)

    assert_equal ["two"], next_page.map(&:first_name)
  end

  test "paginating backwards" do
    create :member, first_name: "one"
    create :member, first_name: "two"
    create :member, first_name: "three"

    page = PaginatedRelation.new(
      relation: Member.all,
      per_page: 1,
    ).page(2)

    assert_equal ["three"], page.map(&:first_name)
    assert_equal ["two"], page.previous.map(&:first_name)
    assert_equal ["one"], page.previous.previous.map(&:first_name)
  end

  test "having next/previous page" do
    create :member, first_name: "one"
    create :member, first_name: "two"
    create :member, first_name: "three"

    page = PaginatedRelation.new(
      relation: Member.all,
      per_page: 1,
    ).page(0)

    assert_equal false, page.previous_page?
    assert_equal true, page.next_page?

    middle_page = PaginatedRelation.new(
      relation: Member.all,
      per_page: 1,
    ).page(1)

    assert_equal true, middle_page.previous_page?
    assert_equal true, middle_page.next_page?

    last_page = PaginatedRelation.new(
      relation: Member.all,
      per_page: 1,
    ).page(2)

    assert_equal true, last_page.previous_page?
    assert_equal false, last_page.next_page?
  end
end
